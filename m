From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4: Enable serial controllers on Origen and
 SMDKV310
Date: Mon, 08 Oct 2012 15:15:04 +0200
Message-ID: <1587144.mixS1B3zoJ@amdc1227>
References: <1349701968-6675-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1349701968-6675-1-git-send-email-t.figa@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: kgene.kim@samsung.com
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, tomasz.figa@gmail.com, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kgene,

On Monday 08 of October 2012 15:12:48 Tomasz Figa wrote:
> This patch adds status override of serial nodes to enable used serial
> ports on Origen and SMDKV310 board.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4210-origen.dts   | 16 ++++++++++++++++
>  arch/arm/boot/dts/exynos4210-smdkv310.dts | 16 ++++++++++++++++
>  2 files changed, 32 insertions(+)
> 

I think you missed this patch when applying Exynos dts reorganization 
patches. It is needed to enable serial ports on Origen and SMDKV310 boards. 
Could you apply it as well?

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
