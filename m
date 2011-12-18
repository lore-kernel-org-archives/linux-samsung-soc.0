From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 3/7] s3c-hsudc: add a remove function
Date: Sun, 18 Dec 2011 14:43:19 +0000
Message-ID: <20111218144319.GU14542@n2100.arm.linux.org.uk>
References: <201112172023.05519.heiko@sntech.de> <201112172026.34215.heiko@sntech.de> <20111218081048.GS14542@n2100.arm.linux.org.uk> <201112181444.39812.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:45439 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752306Ab1LROnn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Dec 2011 09:43:43 -0500
Content-Disposition: inline
In-Reply-To: <201112181444.39812.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Greg KH <greg@kroah.com>, Felipe Balbi <balbi@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, linux-arm-kernel@lists.infradead.org

On Sun, Dec 18, 2011 at 02:44:39PM +0100, Heiko St=FCbner wrote:
> Am Sonntag 18 Dezember 2011, 09:10:48 schrieb Russell King - ARM Linu=
x:
> > On Sat, Dec 17, 2011 at 08:26:33PM +0100, Heiko St=FCbner wrote:
> > > As the driver is also buildable as a module it should need
> > > a cleanup function for the removal of the module.
> >=20
> > My guess is that this wasn't implemented because of the embedded st=
ruct
> > device lifetime rules for the gadget - to prevent the unbinding of =
the
> > driver.
> >=20
> > Until the struct device lifetime gets fixed, you must not allow the=
 module
> > nor the data structure containing the struct device to be freed.
>=20
> I understand where this problem comes from (the release method is pot=
entially=20
> gone with the module before it is called) but after more reading, I h=
ave a=20
> hard time believing that a lot of the other gadget drivers would be w=
rong as=20
> well. Some of them since 2009 or possibly earlier.
>=20
> Gadgets with embedded release methods: langwell_udc, goku_udc, fsl_qe=
_udc (and=20
> fsl_udc_core), amd5536udc, net2280, pch_udc, cil13xxx_udc, dummy_hcd,=
=20
> omap_udc, net2272, mc_udc_core
>=20
> Gadgets which use the release method from its pdev->dev but also free=
 the=20
> struct with the gadget in their remove method: r8a66597-udc, m66592-u=
dc,=20
> fusb300_udc. (possibly before the release function is called)
>=20
> On the other hand, the gets and puts of the udc->gadget.dev should be=
 paired=20
> correctly and it's only an intermediate device between the udc and th=
e gadget=20
> driver, so that the call to device_unregister in the remove method sh=
ould put=20
> the refcount to 0 and thus init the cleanup (including the call to re=
lease)=20
> before the module is removed.
>=20
> So, I am very confused :-).

Try this patch.  If your system oopses 5 seconds after you remove the
module, you have a lifetime bug.

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
index 640bd98..fe57f3a 100644
--- a/lib/kobject.c
+++ b/lib/kobject.c
@@ -575,9 +575,23 @@ static void kobject_cleanup(struct kobject *kobj)
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
+	INIT_DELAYED_WORK(&kobj->release, kobject_delayed_cleanup);
+	schedule_delayed_work(&kobj->release, 5 * HZ);
+#else
+	kobject_cleanup(kobj);
+#endif
 }
=20
 /**
