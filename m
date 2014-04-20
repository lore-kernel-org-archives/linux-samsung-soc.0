From: Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/7] ARM: dtsi: add node for simple phy provider for exynos5250
Date: Sun, 20 Apr 2014 16:53:58 +0530
Message-ID: <1397993044-14564-2-git-send-email-rahul.sharma@samsung.com>
References: <1397993044-14564-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1397993044-14564-1-git-send-email-rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Rahul Sharma <Rahul.Sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Add dt node for simple phy provider for exynos5250 SoC.

Signed-off-by: Rahul Sharma <Rahul.Sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos5250.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)
 mode change 100644 => 100755 arch/arm/boot/dts/exynos5250.dtsi

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
old mode 100644
new mode 100755
index 3742331..bbf2d64
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -736,4 +736,10 @@
 		clocks = <&clock 348>;
 		clock-names = "secss";
 	};
+
+	simple_phys: simple-phys@10040000 {
+		compatible = "samsung,exynos5250-simple-phy";
+		reg = <0x10040000 0x10000>;
+		#phy-cells = <1>;
+	};
 };
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
