From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [[PATCH v2] 03/11] ARM: EXYNOS: fixups for big-endian operation
Date: Tue, 21 Jun 2016 13:16:24 +0200
Message-ID: <57692208.9000405@samsung.com>
References: <1466504432-24187-1-git-send-email-ben.dooks@codethink.co.uk>
 <1466504432-24187-4-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1466504432-24187-4-git-send-email-ben.dooks@codethink.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ben Dooks <ben.dooks@codethink.co.uk>, matthew.leach@codethink.co.uk, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@lists.codethink.co.uk
List-Id: linux-samsung-soc@vger.kernel.org

On 06/21/2016 12:20 PM, Ben Dooks wrote:
> If the kernel is built big endian, then using the __raw read and write IO
> accessors is not going to work as they end up writing big-endian data to
> little-endian IO registers. Fix this by using the readl and writel relaxed
> versions which ensure little endian IO.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  arch/arm/mach-exynos/firmware.c | 16 ++++++++--------
>  arch/arm/mach-exynos/headsmp.S  |  3 +++
>  arch/arm/mach-exynos/platsmp.c  |  4 ++--
>  3 files changed, 13 insertions(+), 10 deletions(-)


Thanks, applied for v4.8.

Best regards,
Krzysztof
