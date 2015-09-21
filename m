From: =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio.lopez@collabora.co.uk>
Subject: [PATCH v3 0/4] platform/chrome: vboot context support
Date: Mon, 21 Sep 2015 10:38:19 -0300
Message-ID: <1442842703-5309-1-git-send-email-emilio.lopez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:58860 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756274AbbIUNi7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Sep 2015 09:38:59 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: gregkh@linuxfoundation.org, olof@lixom.net, kgene@kernel.org, k.kozlowski@samsung.com, linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio.lopez@collabora.co.uk>

Hi everyone,

This series adds support for reading and writing the verified boot cont=
ext
nvram space on the EC using the cros_ec sysfs interface.

The first patch improves is_visible() functionality, making it work
for binary attributes as well as normal ones. This is needed so the
sysfs group can be hidden when the EC doesn't offer any space for
the context.

The second patch documents the property used in the binding documents.
This used to live in the next patch on the previous versions of this se=
ries.

The third patch is the actual code implementing the interface to read
and write the context data.

The fourth patch adds the DT properties on peach boards which, judging =
by
the vendor tree, use the EC to store the verified boot context.

The series was tested on a peach pi and was found to work OK there. As
always, all comments and further tests are welcome :)

Cheers!
Emilio

Emilio L=C3=B3pez (4):
  sysfs: Support is_visible() on binary attributes
  Documentation: bindings: mfd: cros ec: document vbc EC property
  platform/chrome: Support reading/writing the vboot context
  ARM: dts: Enable EC vboot context support on Peach boards

 Documentation/devicetree/bindings/mfd/cros-ec.txt |   4 +
 arch/arm/boot/dts/exynos5420-peach-pit.dts        |   1 +
 arch/arm/boot/dts/exynos5800-peach-pi.dts         |   1 +
 drivers/platform/chrome/Makefile                  |   3 +-
 drivers/platform/chrome/cros_ec_dev.c             |   1 +
 drivers/platform/chrome/cros_ec_vbc.c             | 137 ++++++++++++++=
++++++++
 fs/sysfs/group.c                                  |  17 ++-
 include/linux/mfd/cros_ec.h                       |   1 +
 include/linux/sysfs.h                             |  18 ++-
 9 files changed, 176 insertions(+), 7 deletions(-)
 create mode 100644 drivers/platform/chrome/cros_ec_vbc.c

--=20
2.1.4
