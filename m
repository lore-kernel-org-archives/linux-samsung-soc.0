From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] memory: samsung: exynos-srom: fix wrong count of registers
Date: Wed, 06 Jul 2016 08:17:12 +0200
Message-ID: <577CA268.5020606@samsung.com>
References: <1467718817-19239-1-git-send-email-sw0312.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1467718817-19239-1-git-send-email-sw0312.kim@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kgene@kernel.org
Cc: cw00.choi@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 07/05/2016 01:40 PM, Seung-Woo Kim wrote:
> This patch fixes wrong count of array for srom registers from probe
> function.
> 
> Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
> ---
>  drivers/memory/samsung/exynos-srom.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied.

Best regards,
Krzysztof
