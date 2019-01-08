From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: mach-s3c24xx: Fix boolean expressions in osiris_dvs_notify
Date: Tue, 8 Jan 2019 08:42:24 +0100
Message-ID: <CAJKOXPcKgFpRbFufxw5LVv-boWwdvSq-zG9gw1u7P9-f+5BJMQ@mail.gmail.com>
References: <20190103201408.GA27754@embeddedor> <20190107194324.GC3313@kozik-lap>
 <1abcd26c-aa10-9481-ed53-3c3654842757@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1abcd26c-aa10-9481-ed53-3c3654842757@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Ben Dooks <ben@simtec.co.uk>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 7 Jan 2019 at 21:33, Gustavo A. R. Silva <gustavo@embeddedor.com> wrote:
>
> Hi Krzysztof,
>
> On 1/7/19 1:43 PM, Krzysztof Kozlowski wrote:
> > On Thu, Jan 03, 2019 at 02:14:08PM -0600, Gustavo A. R. Silva wrote:
> >> Fix boolean expressions by using logical AND operator '&&'
> >> instead of bitwise operator '&'.
> >>
> >> This issue was detected with the help of Coccinelle.
> >>
> >> Fixes: 4fa084af28ca ("ARM: OSIRIS: DVS (Dynamic Voltage Scaling) supoort.")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> >> ---
> >>   arch/arm/mach-s3c24xx/mach-osiris-dvs.c | 8 ++++----
> >
> > Thanks, applied with fixing up -Wparentheses warning. I think you should
> > update your GCC.
> >
>
> Thanks for that.
>
> I wonder if you could take these too:
>
> https://lore.kernel.org/lkml/418252fcd77472413ce15ac3df167e448a4defe9.1546667177.git.gustavo@embeddedor.com/
> https://lore.kernel.org/lkml/2795c5ba939fe23dda6c86135d56e68433f7d68a.1546667177.git.gustavo@embeddedor.com/

Can't do. I am maintainer only for ARM/Samsung platform and these are
for Integrator.

Best regards,
Krzysztof
