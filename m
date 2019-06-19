From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH][v2] ARM: dts: exynos: add flash support to galaxy-s3
 boards
Date: Wed, 19 Jun 2019 19:19:18 +0200
Message-ID: <20190619171918.GA24076@kozik-lap>
References: <20190615170428.GA3447@kozik-lap>
 <20190618001742.2828-1-GNUtoo@cyberdimension.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190618001742.2828-1-GNUtoo@cyberdimension.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Simon Shields <simon@lineageos.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jun 18, 2019 at 02:17:42AM +0200, Denis 'GNUtoo' Carikli wrote:
> From: Simon Shields <simon@lineageos.org>
> 
> The galaxy s3 boards use an aat1290 to control the flash LED.
> This patch adds the relevant device tree configuration to use it.
> 
> Signed-off-by: Simon Shields <simon@lineageos.org>
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org> [rebase]
> ---
>  arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 32 +++++++++++++++++++++
>  1 file changed, 32 insertions(+)

Thanks, applied.

Best regards,
Krzysztof
