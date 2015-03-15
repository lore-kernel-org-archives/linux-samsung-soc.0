From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v4 1/5] ARM: dts: Clean up exynos5410-smdk5410 indentation
Date: Sun, 15 Mar 2015 23:00:30 +0100
Message-ID: <1426456834-6308-2-git-send-email-afaerber@suse.de>
References: <1426456834-6308-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426456834-6308-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, =?UTF-8?q?=EA=B9=80=ED=95=99=EC=A3=BC?= <ruppi.kim@hardkernel.com>, Tomasz Figa <tomasz.figa@gmail.com>, Humberto Naves <hsnaves@gmail.com>, Jan Kiszka <jan.kiszka@siemens.com>, Johann Pfefferl <johann.pfefferl@siemens.com>, Ben Gamari <bgamari.foss@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
List-Id: linux-samsung-soc@vger.kernel.org

The UART status properties are indented one level too deep, and we want
to derive a device tree for the ODROID-XU. Fix this before it propagate=
s.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v1 -> v2 -> v3: Unchanged
=20
 arch/arm/boot/dts/exynos5410-smdk5410.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5410-smdk5410.dts b/arch/arm/boot/=
dts/exynos5410-smdk5410.dts
index be3e02530b42..cebeaab3abec 100644
--- a/arch/arm/boot/dts/exynos5410-smdk5410.dts
+++ b/arch/arm/boot/dts/exynos5410-smdk5410.dts
@@ -62,13 +62,13 @@
 };
=20
 &uart0 {
-		status =3D "okay";
+	status =3D "okay";
 };
=20
 &uart1 {
-		status =3D "okay";
+	status =3D "okay";
 };
=20
 &uart2 {
-		status =3D "okay";
+	status =3D "okay";
 };
--=20
2.3.1
