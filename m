From: =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio.lopez@collabora.co.uk>
Subject: [PATCH 0/3] platform/chrome: vboot context support
Date: Tue,  8 Sep 2015 09:07:43 -0300
Message-ID: <1441714066-5599-1-git-send-email-emilio.lopez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:38233 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754246AbbIHMI1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Sep 2015 08:08:27 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: gregkh@linuxfoundation.org, olof@lixom.net, kgene@kernel.org, k.kozlowski@samsung.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio.lopez@collabora.co.uk>

Hi everyone,

This series adds support for reading and writing the verified boot cont=
ext
nvram space on the EC using the cros_ec sysfs interface.

The first patch fixes is_visible() functionality, making it work for bi=
nary
attributes as well as normal ones. This is needed so the sysfs group
can be hidden when the EC doesn't offer any space for the context.

The second patch is the actual code implementing the interface to read
and write the context data.

The third patch adds the DT properties on peach boards which, judging b=
y
the vendor tree, use the EC to store the verified boot context.

The series was tested on a peach pi and was found to work OK there. As
always, all comments and further tests are welcome :)

Cheers!
Emilio

Emilio L=C3=B3pez (3):
  sysfs: Fix is_visible() support for binary attributes
  platform/chrome: Support reading/writing the vboot context
  ARM: dts: Enable EC vboot context support on Peach boards

 Documentation/devicetree/bindings/mfd/cros-ec.txt |   4 +
 arch/arm/boot/dts/exynos5420-peach-pit.dts        |   1 +
 arch/arm/boot/dts/exynos5800-peach-pi.dts         |   1 +
 drivers/platform/chrome/Makefile                  |   5 +-
 drivers/platform/chrome/cros_ec_dev.c             |   1 +
 drivers/platform/chrome/cros_ec_vbc.c             | 137 ++++++++++++++=
++++++++
 fs/sysfs/group.c                                  |  22 +++-
 include/linux/mfd/cros_ec.h                       |   1 +
 8 files changed, 167 insertions(+), 5 deletions(-)
 create mode 100644 drivers/platform/chrome/cros_ec_vbc.c

--=20
2.1.4
