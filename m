From: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Subject: =?UTF-8?B?UmVbMl06IFtQQVRDSCA0LzRdIEFSTTogczNjMjR4eDogRml4IHN3aXRjaGlu?=
 =?UTF-8?B?ZyBGSUZPIGluIGFyY2hfZW5hYmxlX3VhcnRfZmlmbyBmdW5jdGlvbg==?=
Date: Thu, 04 Apr 2013 22:54:32 +0400
Message-ID: <1365101672.722585953@f87.mail.ru>
References: <1362216174-10478-1-git-send-email-shc_work@mail.ru>
 <1362216174-10478-4-git-send-email-shc_work@mail.ru>
Reply-To: =?UTF-8?B?QWxleGFuZGVyIFNoaXlhbg==?= <shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?UTF-8?B?S3VramluIEtpbQ==?= <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, =?UTF-8?B?J0JlbiBEb29rcyc=?= <ben-linux@fluff.org>, =?UTF-8?B?J0FybmQgQmVyZ21hbm4n?= <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello.

> Alexander Shiyan wrote:
> > 
> > When CONFIG_S3C_BOOT_UART_FORCE_FIFO symbol is set, we should
> > enable FIFO but actually switch command is missing in the code.
> > This patch adds this switch.
> > 
> > Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> > ---
> >  arch/arm/plat-samsung/include/plat/uncompress.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm/plat-samsung/include/plat/uncompress.h
> > b/arch/arm/plat-samsung/include/plat/uncompress.h
> > index 438b248..30fedd9 100644
> > --- a/arch/arm/plat-samsung/include/plat/uncompress.h
> > +++ b/arch/arm/plat-samsung/include/plat/uncompress.h
> > @@ -130,6 +130,8 @@ static inline void arch_enable_uart_fifo(void)
> >  			if (!(fifocon & S3C2410_UFCON_RESETBOTH))
> >  				break;
> >  		}
> > +
> > +		uart_wr(S3C2410_UFCON, S3C2410_UFCON_FIFOMODE);
> 
> Well, I think, if required, this should be moved into 'if (!(fifocon &
> S3C2410_UFCON_FIFOMODE))'.

Already here.

---
