From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RESEND] ARM: dts: arndale: Add audio support (WM1811
 CODEC boards)
Date: Wed, 2 Oct 2019 17:59:40 +0200
Message-ID: <20191002155940.GA10341@kozik-lap>
References: <CGME20191002152842eucas1p281f3fb4b7efffaf74fa89ffaa4108b3f@eucas1p2.samsung.com>
 <20191002152831.18509-1-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20191002152831.18509-1-s.nawrocki@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Oct 02, 2019 at 05:28:31PM +0200, Sylwester Nawrocki wrote:
> Add sound node and the clock configurations for the I2S controller
> for audio support on the Exynos5250 SoC Arndale boards with
> WM1811 based audio daughter board.
> 
> We need to increase drive strength of the I2S bus, otherwise
> the audio CODEC doesn't work. Likely the CODEC's master clock
> is the main issue here.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes since v2:
>  - none.
> Changes since v1:
>  - moved &clock, &clock_audss parts to preserve alphabetical order
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts | 27 +++++++++++++++++++++++-

Thanks, applied.

Best regards,
Krzysztof
