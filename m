From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [[PATCH v2] 08/11] irqchip: exynos: fix usage of __raw IO
Date: Thu, 23 Jun 2016 18:53:37 +0000
Message-ID: <20160623185337.GJ9922@io.lakedaemon.net>
References: <1466504432-24187-1-git-send-email-ben.dooks@codethink.co.uk>
 <1466504432-24187-9-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1466504432-24187-9-git-send-email-ben.dooks@codethink.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, Marc Zyngier w <marc.zyngier@arm.com>, matthew.leach@codethink.co.uk, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Ben,

On Tue, Jun 21, 2016 at 11:20:29AM +0100, Ben Dooks wrote:
> Fix the use of __raw IO accesors when the readl/writel_relaxed
> are better. This should fix issues if the kernel is running as
> big endian.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> CC: Thomas Gleixner <tglx@linutronix.de>
> CC: Jason Cooper <jason@lakedaemon.net>
> CC: Marc Zyngier <marc.zyngier@arm.com>w
> ---
>  drivers/irqchip/exynos-combiner.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Applied patches 8 and 9 of this series to irqchip/misc with minor
subject line reformatting (watch double square brackets).

thx,

Jason.
