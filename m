From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 2/2] ARM: SAMSUNG: Cleanup resources by using macro
Date: Tue, 4 Oct 2011 17:26:02 +0200
Message-ID: <201110041726.03056.arnd@arndb.de>
References: <005901cc817e$51a56d00$f4f04700$%kim@samsung.com>
	<1957187.UuLfeIqa6D@wuerfel>
	<019301cc8293$79a6f510$6cf4df30$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <019301cc8293$79a6f510$6cf4df30$%kim@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday 04 October 2011, Kukjin Kim wrote:
> > I think the string concatenation really just obfuscates the code, and
> > it does not actually save much at all. When you replace
> > 
> > +       [0] = SAMSUNG_RES_MEM(S3C, WDT, SZ_1K),
> > +       [1] = SAMSUNG_RES_IRQ(WDT),
> > 
> > with
> > 
> > +       [0] = DEFINE_RES_MEM(S3C_PA_WDT, SZ_1K),
> > +       [1] = DEFINE_RES_IRQ(IRQ_WDT),
> > 
> > you need practically no extra space, but you gain the advantages that
> > 
> > * Someone using grep for DEFINE_RES_MEM finds all memory resources without
> >   having to look up what your macros do an where they are used.
> > * Someone using grep to look for S3C_PA_WDT finds the place where it is
> used.
> > * Someone reading the resource definition immediately knows what the
> >   macro does if familiar with other platforms using that macro.
> 
> Yes, right. But I'm preparing to reduce the 'soc' part to consolidate some
> duplicated resources and platform data after this and the new SAMSUNG_RES
> macro will be used.

Hmm, can't you instead change the names of these constants to be
always the same? That would let you use the regular DEFINE_RES_*
definitions without having to introduce your own.

	Arnd
