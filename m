From: =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio.lopez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: [PATCH v2 0/3] platform/chrome: vboot context support
Date: Mon, 14 Sep 2015 09:34:06 -0300
Message-ID: <1442234049-18637-1-git-send-email-emilio.lopez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio.lopez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi everyone,

This series adds support for reading and writing the verified boot cont=
ext
nvram space on the EC using the cros_ec sysfs interface.

The first patch improves is_visible() functionality, making it work
for binary attributes as well as normal ones. This is needed so the
sysfs group can be hidden when the EC doesn't offer any space for
the context.

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
  sysfs: Support is_visible() on binary attributes
  platform/chrome: Support reading/writing the vboot context
  ARM: dts: Enable EC vboot context support on Peach boards

 Documentation/devicetree/bindings/mfd/cros-ec.txt |   4 +
 arch/arm/boot/dts/exynos5420-peach-pit.dts        |   1 +
 arch/arm/boot/dts/exynos5800-peach-pi.dts         |   1 +
 drivers/platform/chrome/Makefile                  |   5 +-
 drivers/platform/chrome/cros_ec_dev.c             |   1 +
 drivers/platform/chrome/cros_ec_vbc.c             | 137 ++++++++++++++=
++++++++
 fs/sysfs/group.c                                  |  17 ++-
 include/linux/mfd/cros_ec.h                       |   1 +
 include/linux/sysfs.h                             |  18 ++-
 9 files changed, 178 insertions(+), 7 deletions(-)
 create mode 100644 drivers/platform/chrome/cros_ec_vbc.c

--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
