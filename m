From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] i2c: s3c2410: Properly handle interrupts of number 0
Date: Fri, 2 Mar 2018 14:49:09 +0300
Message-ID: <20180302114909.u6kqdszt3aew2io2@mwanda>
References: <1519936484-23132-1-git-send-email-krzk@kernel.org>
 <20180302111931.GX9418@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180302111931.GX9418@n2100.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-i2c@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Mar 02, 2018 at 11:19:31AM +0000, Russell King - ARM Linux wrote:
> On Thu, Mar 01, 2018 at 09:34:44PM +0100, Krzysztof Kozlowski wrote:
> > Interrupt number 0 (returned by platform_get_irq()) might be a valid IRQ
> > so do not treat it as an error.  If interrupt 0 was configured, the driver
> > would exit the probe early, before finishing initialization, but with
> > 0-exit status.
> 
> The official position (as stated by Linus) is that interrupt zero is
> not a valid interrupt for peripheral drivers (it may be valid within
> architecture code for things like the x86 PIT, but nothing else.)
> 
> You need to number your platform interrupts from one rather than zero.
> 
> Note that there have been patches proposed to make platform_get_irq()
> return an error rather than returning a value of zero, so changing
> the driver in this way is not a good idea.
> 

Those patches to make platform_get_irq() return error codes were merged
12 years ago in commit 305b3228f9ff ("[PATCH] driver core:
platform_get_irq*(): return -ENXIO on error").

This patch just drops the check for zero which is should be fine.

regards,
dan carpenter
