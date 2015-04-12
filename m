From: Anand Moon <linux.amoon@gmail.com>
Subject: v3 Exynos5422 odroidxu3 pwm-fan control using thermal sensors
Date: Mon, 13 Apr 2015 00:24:06 +0930
Message-ID: <1428850452-4178-1-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lukasz Majewski <l.majewski@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Eduardo Valentin <edubezval@gmail.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Markus Reichl <m.reichl@fivetechno.de>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This work depeds upon work done by Lukasz Majewski <l.majewski@samsung.com>
and Sjoerd Simons <sjoerd.simons@collabora.co.uk> regarding the pwm-fan.

Changes from v1
        fixed the registration of thermal sensor to tmu_cpu0
Dropped patches.
        0005-pwm-samsung-Fix-output-race-on-disabling.patch
        0006-hwmon-pwm-fan-Update-the-duty-cycle-inorder-to-contr.patch
changes from v2
Added patch
	0006-hwmon-pwm-fan-Update-the-duty-cycle-inorder-to-contr.patch

-Anand Moon
