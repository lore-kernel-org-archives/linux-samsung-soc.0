From: David Binderman <dcb314@hotmail.com>
Subject: linux-4.11-rc1/drivers/gpu/drm/exynos/exynos5433_drm_decon.c:681:
 suspicious mask ?
Date: Mon, 6 Mar 2017 10:05:19 +0000
Message-ID: <DB5PR08MB0967CD7B84545DE129126A619C2C0@DB5PR08MB0967.eurprd08.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "inki.dae@samsung.com" <inki.dae@samsung.com>, "jy0922.shim@samsung.com" <jy0922.shim@samsung.com>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "airlied@linux.ie" <airlied@linux.ie>, "kgene@kernel.org" <kgene@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>, "javier@osg.samsung.com" <javier@osg.samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello there,

linux-4.11-rc1/drivers/gpu/drm/exynos/exynos5433_drm_decon.c:681]: (warning) Result of operator '|' is always true if one operand is non-zero. Did you intend to use '&'?

Source code is

    if (ctx->out_type | I80_HW_TRG) {

Also in the same file:

[drivers/gpu/drm/exynos/exynos5433_drm_decon.c:131]: (style) Same expression on both sides of '|'.

Source code is

       writel(TRIGCON_TE_AUTO_MASK | TRIGCON_SWTRIGEN
               | TRIGCON_TE_AUTO_MASK | TRIGCON_SWTRIGEN,

Regards

David Binderman
