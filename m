From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [RFC 05/12] phy: use of_phy_simple_xlate for NULL xlate function
Date: Mon, 21 Oct 2013 16:18:24 +0200
Message-ID: <1382365111-6533-6-git-send-email-t.stanislaws@samsung.com>
References: <1382365111-6533-1-git-send-email-t.stanislaws@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1382365111-6533-1-git-send-email-t.stanislaws@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, t.figa@samsung.com, kishon@ti.com, sw0312.kim@samsung.com, inki.dae@samsung.com, rahul.sharma@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, mturquette@linaro.org, Tomasz Stanislawski <t.stanislaws@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Use default handler of_phy_simple_xlate() when NULL is passed as argument to
of_phy_provider_register().

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
---
 drivers/phy/phy-core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 03cf8fb..c38ae1e7 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -575,7 +575,7 @@ struct phy_provider *__of_phy_provider_register(struct device *dev,
 
 	phy_provider->dev = dev;
 	phy_provider->owner = owner;
-	phy_provider->of_xlate = of_xlate;
+	phy_provider->of_xlate = of_xlate ? of_xlate : of_phy_simple_xlate;
 
 	mutex_lock(&phy_provider_mutex);
 	list_add_tail(&phy_provider->list, &phy_provider_list);
-- 
1.7.9.5
