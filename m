From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH v6 1/3] of/pci: Unify pci_process_bridge_OF_ranges from
 Microblaze and PowerPC
Date: Tue, 16 Apr 2013 12:49:03 +0100
Message-ID: <20130416114903.GA13259@arm.com>
References: <1365693969-23907-1-git-send-email-Andrew.Murray@arm.com>
 <1365693969-23907-2-git-send-email-Andrew.Murray@arm.com>
 <20130415145741.4e4c362b@skate> <516C2FEF.7080006@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <516C2FEF.7080006@monstr.eu>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michal Simek <monstr@monstr.eu>
Cc: "siva.kallam@samsung.com" <siva.kallam@samsung.com>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, Liviu Dudau <Liviu.Dudau@arm.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "paulus@samba.org" <paulus@samba.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "jg1.han@samsung.com" <jg1.han@samsung.com>, "jgunthorpe@obsidianresearch.com" <jgunthorpe@obsidianresearch.com>, "thomas.abraham@linaro.org" <thomas.abraham@linaro.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Apr 15, 2013 at 05:50:55PM +0100, Michal Simek wrote:
> That's why please add this header to this patch.
> 
> diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
> index 3e428a1..f30887e 100644
> --- a/drivers/of/of_pci.c
> +++ b/drivers/of/of_pci.c
> @@ -1,6 +1,7 @@
>  #include <linux/kernel.h>
>  #include <linux/export.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/of_pci.h>
>  #include <asm/prom.h>
> 
> 
> When you fix it:
> Acked-by: Michal Simek <monstr@monstr.eu>

I've added this fix to the latest patchset (v7) and also your Ack - thanks for
your feedback (and the robot...).

Andrew Murray
