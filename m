From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [[PATCH v2] 07/11] ARM: EXYNOS: fixup for __raw operations in
 suspend.c
Date: Tue, 21 Jun 2016 13:17:54 +0200
Message-ID: <57692262.1010800@samsung.com>
References: <1466504432-24187-1-git-send-email-ben.dooks@codethink.co.uk>
 <1466504432-24187-8-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1466504432-24187-8-git-send-email-ben.dooks@codethink.co.uk>
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
> Fix the PMU code endian access code to deal with kernels built for
> big endian operation by changing the __raw IO accessors to the
> _relaxed variants.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> ---
>  arch/arm/mach-exynos/suspend.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)


Thanks, applied for v4.8.

Best regards,
Krzysztof
