From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] i2c: s3c2410: Properly handle interrupts of number 0
Date: Sat, 3 Mar 2018 18:25:17 +0200
Message-ID: <CAHp75VcPMmATbCCczm3NqNDGCda6J5vga-FDW4SFABaqBKe4iw@mail.gmail.com>
References: <1519936484-23132-1-git-send-email-krzk@kernel.org>
 <20180302111931.GX9418@n2100.armlinux.org.uk> <20180302124647.sfhnto77wgdh5sv6@katana>
 <20180302125907.GA9418@n2100.armlinux.org.uk> <20180302135854.76ue5jzsg7lvxjxw@katana>
 <20180302140901.lrjqiaa2k4nxkqco@mwanda> <20180302153221.GB9418@n2100.armlinux.org.uk>
 <20180302162821.bmsxgrqqaginjooo@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180302162821.bmsxgrqqaginjooo@lakrids.cambridge.arm.com>
Sender: stable-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Dan Carpenter <dan.carpenter@oracle.com>, linux-samsung-soc@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>, Ben Dooks <ben-linux@fluff.org>, Stable <stable@vger.kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Mar 2, 2018 at 6:28 PM, Mark Rutland <mark.rutland@arm.com> wrote:
> On Fri, Mar 02, 2018 at 03:32:22PM +0000, Russell King - ARM Linux wrote:
>> How do we break this status quo and finally solve the IRQ 0 and
>> NO_IRQ issue?

Guys, the question: Wouldn't be request_irq() failed when it gets a
wrong number on input?

-- 
With Best Regards,
Andy Shevchenko
