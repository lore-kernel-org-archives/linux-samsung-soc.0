From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH] ARM: MCPM: Add provision for platform specific wfi
 alternative
Date: Mon, 11 Feb 2019 10:57:38 -0500 (EST)
Message-ID: <nycvar.YSQ.7.76.1902111056070.2213@knanqh.ubzr>
References: <20190210231212.20470-1-stuart.menefy@mathembedded.com>
 <CAPoDyq6vzXuR+Z=t9eyJytuOGZknyY1nOY7v_ir86VTZM3DH5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAPoDyq6vzXuR+Z=t9eyJytuOGZknyY1nOY7v_ir86VTZM3DH5g@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stuart Menefy <stuart.menefy@mathembedded.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 11 Feb 2019, Stuart Menefy wrote:

> Folks
> 
> On Sun, 10 Feb 2019 at 23:12, Stuart Menefy
> <stuart.menefy@mathembedded.com> wrote:
> >
> > On some platforms (in particular the Exynos5260) the wfi is not
> > executed directly by the operating system but by trapping into the
> > secure monitor. This allows us to replicate the behaviour of the
> > vendor supplied kernel using the MCPM framework.
> >
> > Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
> 
> I forgot to add, this is a part of a series of patches which updates
> the Exynos 5260
> support, allowing use of the kernel on secure parts and adding suspend
> functionality,
> Version 1 of the patches has been posted to the samsung-soc mailing list:
> https://www.spinics.net/lists/linux-samsung-soc/#65035
> and I'm just about to post version 2. However as this is the only patch which
> touches generic ARM files I though I'd better check the approach is acceptable
> to a wider audience.

I was about to ask that you also post those patches making use of this 
change.  It is not possible to evaluate if the approach makes sense 
without seeing how it is used.


Nicolas
