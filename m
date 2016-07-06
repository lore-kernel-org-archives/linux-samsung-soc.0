From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] arm64: dts: Fix rtc by providing rtc_src clock
Date: Wed, 06 Jul 2016 08:21:40 +0200
Message-ID: <577CA374.4000900@samsung.com>
References: <1467713107-15932-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1467713107-15932-1-git-send-email-alim.akhtar@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com, linux-kernel@vger.kernel.org, javier@osg.samsung.com, catalin.marinas@arm.com
List-Id: linux-samsung-soc@vger.kernel.org

On 07/05/2016 12:05 PM, Alim Akhtar wrote:
> Add rtc source clock as exynos7 needs source (32.768KHz) clock
> for rtc block. Without this currently rtc driver probe is broken
> on this SoC, thats because rtc-s3c driver expect rtc_src clock to
> be provided for _s3c6410-rtc_ type rtc controllers.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos7-espresso.dts |    3 +++
>  1 file changed, 3 insertions(+)

Thanks, applied with adjusted message. I'll send it as a fix for v4.7.

Best regards,
Krzysztof
