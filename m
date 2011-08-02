From: Paulo Marques <pmarques@grupopie.com>
Subject: Re: Question about "Inconsistent kallsyms data"
Date: Tue, 02 Aug 2011 17:29:54 +0100
Message-ID: <4E382602.6050308@grupopie.com>
References: <02ae01cc4d91$aed71670$0c854350$%kim@samsung.com>
	<20110729100241.GB25640@n2100.arm.linux.org.uk>
	<2563791.8cBqodrk1o@flatron> <1514384.7oMe1aulyC@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1514384.7oMe1aulyC@flatron>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Tomasz Figa wrote:
> On Friday 29 of July 2011 at 12:58:32, Tomasz Figa wrote:
>>[...]
>> I will try to bisect the case with s3c6400 defconfig.
> 
> I have no idea why, but I cannot reproduce the issue anymore, even after make 
> distclean or starting with a clean tree. A build system bug?
> 
> I do not know much technical details about the kernel build system, but might 
> it be a concurrency issue (I use make -j5 for building with 5 jobs)?

Usually this is caused by symbols moving slightly between kernel compiles.

This is an explanation of the process I wrote a while ago in a different
thread at LKML:

> Now as for CONFIG_KALLSYMS_EXTRA_PASS: to build the kallsyms table, the
> build process first links a kernel image with an empty kallsyms table
> and use that to fetch information for all the symbols.
> 
> It then uses that information to build the table with the right size,
> and links it again. If everything goes ok, this new version as all the
> symbols in the correct places and the final table can be built with the
> correct addresses.
> 
> The final linking should produce the same result as only the data on the
> kallsyms table changed, but not its size.
> 
> However, there have been bugs in the past with section alignments and
> symbol reordering for symbols with the same address, etc., etc. that
> make this final table not have the exact same size, and the build fails
> with an inconsistent kallsyms data message. At this point, the user can
> turn on the CONFIG_KALLSYMS_EXTRA_PASS and temporarily solve the problem
> while the developers find the correct fix. Without this option, in this
> situation the kernel would simply fail the compilation.
> 
> All this has been stable for a while and this option hasn't been needed
> recently (AFAIK), but if there is some bug in some new binutils or
> something, the option might be needed again.

To check inconsistencies, the Makefile compares ".tmp_System.map" and
"System.map" for differences.

On a normal build they should be identical, but if this fails with
"Inconsistent kallsyms data" you could try comparing the two files to
check which symbols are causing trouble.

-- 
Paulo Marques - www.grupopie.com

"All generalizations are false."
