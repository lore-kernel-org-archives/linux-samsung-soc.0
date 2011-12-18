From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 3/7] s3c-hsudc: add a remove function
Date: Sun, 18 Dec 2011 19:45:18 +0000
Message-ID: <20111218194518.GX14542@n2100.arm.linux.org.uk>
References: <201112172023.05519.heiko@sntech.de> <201112181950.38993.heiko@sntech.de> <20111218190102.GW14542@n2100.arm.linux.org.uk> <201112182033.33640.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:49349 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751519Ab1LRTpk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Dec 2011 14:45:40 -0500
Content-Disposition: inline
In-Reply-To: <201112182033.33640.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Greg KH <greg@kroah.com>, Felipe Balbi <balbi@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org

On Sun, Dec 18, 2011 at 08:33:32PM +0100, Heiko St=FCbner wrote:
> Am Sonntag 18 Dezember 2011, 20:01:02 schrieben Sie:
> > On Sun, Dec 18, 2011 at 07:50:37PM +0100, Heiko St=FCbner wrote:
> > > I didn't get this far. With your patch the Oopses already happen =
during
> > > the startup of the system / the loading of the modules.
> >=20
> > > A bit of the message spew I got during testing with linux-next-20=
111216:
> > In some way, this is a good thing because it's showing that there's
> > problems with kobject lifetime rules.
> >=20
> > The #2 and further oops dumps are a result of corrupting the work
> > queues as a result of #1, so #2 onwards should be ignored.
> >=20
> > I suspect if you avoid loading the s3c_hsudc module these will go a=
way.
>=20
> nope :-), same faults happen even if s3c-hsudc is not present at all.
> So it seems, this delayed cleanup poses problems for other drivers as=
 well.

Okay, let's try to find out which one it is.  Please use the attached
patch - it'll be a little more noisy, reporting which kobjects are
being released at the point when they're added to the workqueue.

Thanks.

diff --git a/include/linux/kobject.h b/include/linux/kobject.h
index ad81e1c..be1c97a 100644
--- a/include/linux/kobject.h
+++ b/include/linux/kobject.h
@@ -26,6 +26,9 @@
 #include <linux/kernel.h>
 #include <linux/wait.h>
 #include <linux/atomic.h>
+#include <linux/workqueue.h>
+
+#define KOBJECT_DEBUG_RELEASE
=20
 #define UEVENT_HELPER_PATH_LEN		256
 #define UEVENT_NUM_ENVP			32	/* number of env pointers */
@@ -65,6 +68,9 @@ struct kobject {
 	struct kobj_type	*ktype;
 	struct sysfs_dirent	*sd;
 	struct kref		kref;
+#ifdef KOBJECT_DEBUG_RELEASE
+	struct delayed_work	release;
+#endif
 	unsigned int state_initialized:1;
 	unsigned int state_in_sysfs:1;
 	unsigned int state_add_uevent_sent:1;
diff --git a/lib/kobject.c b/lib/kobject.c
index 640bd98..5c01a78 100644
--- a/lib/kobject.c
+++ b/lib/kobject.c
@@ -540,7 +540,7 @@ static void kobject_cleanup(struct kobject *kobj)
 	struct kobj_type *t =3D get_ktype(kobj);
 	const char *name =3D kobj->name;
=20
-	pr_debug("kobject: '%s' (%p): %s\n",
+	pr_info("kobject: '%s' (%p): %s\n",
 		 kobject_name(kobj), kobj, __func__);
=20
 	if (t && !t->release)
@@ -575,9 +575,25 @@ static void kobject_cleanup(struct kobject *kobj)
 	}
 }
=20
+#ifdef KOBJECT_DEBUG_RELEASE
+static void kobject_delayed_cleanup(struct work_struct *work)
+{
+	kobject_cleanup(container_of(to_delayed_work(work),
+				     struct kobject, release));
+}
+#endif
+
 static void kobject_release(struct kref *kref)
 {
-	kobject_cleanup(container_of(kref, struct kobject, kref));
+	struct kobject *kobj =3D container_of(kref, struct kobject, kref);
+#ifdef KOBJECT_DEBUG_RELEASE
+	pr_info("kobject: '%s' (%p): %s\n",
+		 kobject_name(kobj), kobj, __func__);
+	INIT_DELAYED_WORK(&kobj->release, kobject_delayed_cleanup);
+	schedule_delayed_work(&kobj->release, HZ);
+#else
+	kobject_cleanup(kobj);
+#endif
 }
=20
 /**
