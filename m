From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/3] arm: dts: exynos: Add serial path for Rinato board
 to get earlycon support
Date: Mon, 16 Apr 2018 20:20:44 +0200
Message-ID: <20180416182044.wa6rujh27jjzu3kv@kozik-lap>
References: <CGME20180416103544eucas1p2c393cdccdb79955b64e57ccc53456479@eucas1p2.samsung.com>
 <20180416103537.29518-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180416103537.29518-1-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Apr 16, 2018 at 12:35:35PM +0200, Marek Szyprowski wrote:
> Add 'chosen' node with 'stdout-path' property to instruct kernel which
> serial driver should be used for kernel console/logs. This allows to
> enable earlycon messages by adding just 'earlycon' parameter to kernel
> command line.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-rinato.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Thanks, applied.

Best regards,
Krzysztof
