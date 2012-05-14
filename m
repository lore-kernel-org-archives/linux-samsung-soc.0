From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH] drivers: genpd: let platform code to register devices into disabled domains
Date: Mon, 14 May 2012 21:51:27 +0200
Message-ID: <201205142151.27177.rjw@sisk.pl>
References: <1333699379-16700-1-git-send-email-m.szyprowski@samsung.com> <201205142104.18693.rjw@sisk.pl> <4FB15B69.60004@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([193.178.161.156]:43586 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757613Ab2ENTqb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 May 2012 15:46:31 -0400
In-Reply-To: <4FB15B69.60004@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, kgene.kim@samsung.com

On Monday, May 14, 2012, Marek Szyprowski wrote:
> Hello,
> 
> On 5/14/2012 9:04 PM, Rafael J. Wysocki wrote:
> > On Monday, May 14, 2012, Marek Szyprowski wrote:
[...]
> >> I'm fine with this solution. Thanks for your help!
> >
> > OK, no problem.
> >
> > Do you want me to apply the patch literally in the above form or should I skip
> > the arch/arm/mach-exynos/pm_domains.c change for now?
> 
> Yes, please skip arch/arm/mach-exynos/pm_domains.c part. We will handle 
> it with a separate patch on Samsung tree.

OK, so below it goes again without that hunk and with a changelog.

Thanks,
Rafael

---
From: Rafael J. Wysocki <rjw@sisk.pl>
Subject: PM / Domains: Make it possible to add devices to inactive domains

The generic PM domains core code currently requires domains to be in
the "power on" state for adding devices to them, but this limitation
turns out to be inconvenient in some situations, so remove it.

For this purpose, make __pm_genpd_add_device() set the device's
need_restore flag if the domain is in the "power off" state, so that
the device's "restore state" (usually .runtime_resume()) callback
is executed when it is resumed after the domain has been turned on.
If the domain is in the "power on" state, the device's need_restore
flag will be cleared by __pm_genpd_add_device(), so that its "save
state" (usually .runtime_suspend()) callback is executed when the
domain is about to be turned off.  However, since that default
behavior need not be always desirable, add a helper function
pm_genpd_dev_need_restore() allowing a device's need_restore flag
to be set/unset at any time.

Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
---
 arch/arm/mach-exynos/pm_domains.c |    2 ++
 drivers/base/power/domain.c       |   27 +++++++++++++++++++++------
 include/linux/pm_domain.h         |    2 ++
 3 files changed, 25 insertions(+), 6 deletions(-)

Index: linux/drivers/base/power/domain.c
===================================================================
--- linux.orig/drivers/base/power/domain.c
+++ linux/drivers/base/power/domain.c
@@ -1269,11 +1269,6 @@ int __pm_genpd_add_device(struct generic
 
 	genpd_acquire_lock(genpd);
 
-	if (genpd->status == GPD_STATE_POWER_OFF) {
-		ret = -EINVAL;
-		goto out;
-	}
-
 	if (genpd->prepared_count > 0) {
 		ret = -EAGAIN;
 		goto out;
@@ -1296,7 +1291,7 @@ int __pm_genpd_add_device(struct generic
 	dev->power.subsys_data->domain_data = &gpd_data->base;
 	gpd_data->base.dev = dev;
 	list_add_tail(&gpd_data->base.list_node, &genpd->dev_list);
-	gpd_data->need_restore = false;
+	gpd_data->need_restore = genpd->status == GPD_STATE_POWER_OFF;
 	if (td)
 		gpd_data->td = *td;
 
@@ -1424,6 +1419,26 @@ void pm_genpd_dev_always_on(struct devic
 EXPORT_SYMBOL_GPL(pm_genpd_dev_always_on);
 
 /**
+ * pm_genpd_dev_need_restore - Set/unset the device's "need restore" flag.
+ * @dev: Device to set/unset the flag for.
+ * @val: The new value of the device's "need restore" flag.
+ */
+void pm_genpd_dev_need_restore(struct device *dev, bool val)
+{
+	struct pm_subsys_data *psd;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->power.lock, flags);
+
+	psd = dev_to_psd(dev);
+	if (psd && psd->domain_data)
+		to_gpd_data(psd->domain_data)->need_restore = val;
+
+	spin_unlock_irqrestore(&dev->power.lock, flags);
+}
+EXPORT_SYMBOL_GPL(pm_genpd_dev_need_restore);
+
+/**
  * pm_genpd_add_subdomain - Add a subdomain to an I/O PM domain.
  * @genpd: Master PM domain to add the subdomain to.
  * @subdomain: Subdomain to be added.
Index: linux/include/linux/pm_domain.h
===================================================================
--- linux.orig/include/linux/pm_domain.h
+++ linux/include/linux/pm_domain.h
@@ -146,6 +146,7 @@ static inline int pm_genpd_of_add_device
 extern int pm_genpd_remove_device(struct generic_pm_domain *genpd,
 				  struct device *dev);
 extern void pm_genpd_dev_always_on(struct device *dev, bool val);
+extern void pm_genpd_dev_need_restore(struct device *dev, bool val);
 extern int pm_genpd_add_subdomain(struct generic_pm_domain *genpd,
 				  struct generic_pm_domain *new_subdomain);
 extern int pm_genpd_remove_subdomain(struct generic_pm_domain *genpd,
@@ -189,6 +190,7 @@ static inline int pm_genpd_remove_device
 	return -ENOSYS;
 }
 static inline void pm_genpd_dev_always_on(struct device *dev, bool val) {}
+static inline void pm_genpd_dev_need_restore(struct device *dev, bool val) {}
 static inline int pm_genpd_add_subdomain(struct generic_pm_domain *genpd,
 					 struct generic_pm_domain *new_sd)
 {
