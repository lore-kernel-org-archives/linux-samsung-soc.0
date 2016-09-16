From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 0/2] ARM: dts: s5p: Remove skeleton.dtsi usage and fix
 memory node DTC warnings
Date: Fri, 16 Sep 2016 09:17:23 +0200
Message-ID: <b7f41347-ded4-0c1f-22c3-b219e90cf01e@kernel.org>
References: <1473348361-15784-1-git-send-email-javier@osg.samsung.com>
 <CGME20160916071725eucas1p2b6cc402af114da6bfc99bfed98b17b48@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1473348361-15784-1-git-send-email-javier@osg.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 09/08/2016 05:25 PM, Javier Martinez Canillas wrote:
> Hello,
> 
> This small patch series is similar to [0] that removed the skeleton.dtsi
> usage for Exynos DTS. This series do the same for S5PV210 boards DTS.
> 
> [0]: http://www.spinics.net/lists/kernel/msg2333268.html
> 
> Best regards,
> Javier
> 
> 
> Javier Martinez Canillas (2):
>   ARM: dts: s5p: Remove skeleton.dtsi inclusion for S5PV210
>   ARM: dts: s5p: Add missing unit name to memory nodes for S5PV210
>     boards

Applied both, thanks.

Best regards,
Krzysztof
