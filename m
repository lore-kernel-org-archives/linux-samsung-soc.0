From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH v2] ARM: Kconfig: let ARM9TDMI and ARM7TDMI invisible.
Date: Thu, 25 Apr 2013 01:59:59 +0800
Message-ID: <8EB7C52E-5044-4B8A-99F2-BCFF9DFDBD2E@jcrosoft.com>
References: <51775BB3.6000607@asianux.com> <51775D88.2000406@asianux.com>
 <20130424174602.GA14496@n2100.arm.linux.org.uk>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130424174602.GA14496@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: kgene.kim@samsung.com, Arnd Bergmann <arnd@arndb.de>, Chen Gang <gang.chen@asianux.com>, Will Deacon <will.deacon@arm.com>, dhowells@redhat.com, linux-samsung-soc@vger.kernel.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


On Apr 25, 2013, at 1:46 AM, Russell King - ARM Linux <linux@arm.linux.org.uk> wrote:

> On Wed, Apr 24, 2013 at 12:20:24PM +0800, Chen Gang wrote:
>> If CONFIG_MMU is disabled, it will let ARM9TDMI and ARM7TDMI visible,
>> but in fact, only AT91X40 need ARM7TDMI, so need not let them visible.
> 
> I'll apply it myself this evening.  Can I add:
> 
> Tested-by: Chen Gang <gang.chen@asianux.com>
you add it mine too

Tested-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

Best Regards,
J.
> 
> to it?
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
