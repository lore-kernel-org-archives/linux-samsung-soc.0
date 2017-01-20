From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: Add CLK_ACLK432_SCALER clock to
 gsc_pd for Exynos5800
Date: Fri, 20 Jan 2017 07:11:04 -0300
Message-ID: <1a244e36-a965-3efb-4413-b40e8c549cf9@osg.samsung.com>
References: <1484864995-10679-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484864995-10679-1-git-send-email-javier@osg.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Shuah Khan <shuahkh@osg.samsung.com>, Andi Shyti <andi.shyti@samsung.com>, Russell King <linux@armlinux.org.uk>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

On 01/19/2017 07:29 PM, Javier Martinez Canillas wrote:
> On Exynos5800 SoC the SCALER block uses 2 input clocks: CLK_ACLK_300_GSCL
> and CLK_ACLK432_SCALER, so both needs to be ungated in order to access it.
> 
> The SoC manual say the CLK_ACLK432_SCALER is needed to access the internal
> buses, so add this clock as another asynchronous bridges (ASB) clock.
> 
> The Exynos5420 only has the CLK_ACLK_300_GSCL clock defined. So just using
> this definition from exynos5420.dtsi in Exynos5800 leads to the following:
> 

Please ignore this patch as suggested by Marek. Instead I'll post a patch
to mark the clock as CLK_IS_CRITICAL, as a temporary workaround until a
proper runtime PM based solution gets merged.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
