From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/4] ARM: dts: Include exynos5250-pinctrl after the nodes
 were defined
Date: Wed, 08 Jul 2015 17:24:42 +0900
Message-ID: <559CDE4A.5090009@samsung.com>
References: <1436333790-18219-1-git-send-email-javier@osg.samsung.com>
 <1436333790-18219-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1436333790-18219-2-git-send-email-javier@osg.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 08.07.2015 14:36, Javier Martinez Canillas wrote:
> The dtc compiler combines all the defined nodes that have the same path
> so a device node definition can be in one file and later be extended in
> another one.
> 
> That's the case of the Exynos5250 pinctrl device nodes that are defined
> in the exynos5250.dtsi file and extended in exynos5250-pinctrl.dtsi.
> 
> But since the exynos5250.dtsi file includes the exynos5250-pinctrl.dtsi
> before the pinctrl device nodes are actually defined, the definition of
> the pinctrl device nodes happens in exynos5250-pinctrl.dtsi and are
> extended in exynos5250.dtsi.
> 
> That is the opposite of the original intention so even when there is no
> difference in practice, the exynos5250-pinctrl.dtsi include should be
> moved at the end of the exynos5250.dtsi file after the pinctrl device
> nodes have been already defined.
> 
> This will also allow to later change the exynos5250-pinctrl.dtsi file
> to use labels instead of full paths to extend the pinctrl nodes. Since
> keeping the include at the top, would cause a dtc build error due the
> pinctrl labels not being defined yet.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
>  arch/arm/boot/dts/exynos5250.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Yeah, I stomped on this too. I left it as is because it is more natural
to have all includes at the beginning... but DTSI for Exynos3250 and
4415 already follow such convention and extending by labels is nice too,
so overall I agree:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
