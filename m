From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: [PATCH 0/3] regulator: max77802: Configure suspend modes
Date: Tue, 11 Nov 2014 13:04:42 +0100
Message-ID: <1415707485-28563-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Abhilash Kesavan <kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Mark,

This series configures the max77802 regulators mode when entering in the
Suspend-to-RAM state. The patches in this series were part of a previous
patch-set that also added initial and suspend mode support for the core.
The previous patch-set was [0] but the feedback was that instead mixing
core changes, bugfixes and new driver features, the series should be split
and core changes posted separately from driver new features.

So this series build on top of the series:

"[PATCH v6 0/5] regulator: of: Add initial and suspend modes support" [1]

and to avoid merge conflicts also depends on Krzysztof's series:

"[PATCH v2 0/3] regulator: max77686/802: Cleanup" [2].

The patch-set is composed of the following patches:

Javier Martinez Canillas (3):
  regulator: max77802: Document binding for regulator operating modes
  regulator: max77802: Fill regulator modes translation callback
  ARM: dts: Configure regulators for suspend on exynos Peach boards

 .../devicetree/bindings/regulator/max77802.txt     | 35 ++++++++++
 arch/arm/boot/dts/exynos5420-peach-pit.dts         | 81 ++++++++++++++++++++++
 arch/arm/boot/dts/exynos5800-peach-pi.dts          | 81 ++++++++++++++++++++++
 drivers/regulator/max77802.c                       |  6 ++
 4 files changed, 203 insertions(+)

Patch #1 documents the operating modes that are supported by the regulators
in the Maxim 77802 PMIC.

Patch #2 fills the .of_map_mode callback function that is used to translate
between the device specific modes configured in the Device Tree and the
standard modes used by the regulator core.

Patch #3 configures the regulators in the Exynos Peach boards which use a
max77802 PMIC. This patch should be merged through the linux-samsung tree
but I added to the series since shows how the DT binding is used in a DTS.

Best regards,
Javier

[0]: https://lkml.org/lkml/2014/11/3/397
[1]: https://lkml.org/lkml/2014/11/10/325
[2]: https://lkml.org/lkml/2014/11/5/118
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
