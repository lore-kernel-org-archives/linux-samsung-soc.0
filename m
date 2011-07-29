From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Question about "Inconsistent kallsyms data"
Date: Fri, 29 Jul 2011 14:55:01 +0200
Message-ID: <14922669.WYSjPzUBX6@wuerfel>
References: <02ae01cc4d91$aed71670$0c854350$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <02ae01cc4d91$aed71670$0c854350$%kim@samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <rmk@arm.linux.org.uk>, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>
List-Id: linux-samsung-soc@vger.kernel.org

On Friday 29 July 2011 10:48:46 Kukjin Kim wrote:
> Hi all,
> 
> When build with s5pc100_defconfig, happens following.
> 
> ...
> KSYM    .tmp_kallsyms2.S
> AS      .tmp_kallsyms2.o
> LD      vmlinux
> SYSMAP  System.map
> SYSMAP  .tmp_System.map
> Inconsistent kallsyms data
> This is a bug - please report about it
> Try make KALLSYMS_EXTRA_PASS=1 as a workaround
> make[1]: *** [vmlinux] Error 1
> make: *** [sub-make] Error 2
> 
> Its HEAD is following (current latest mainline)
> (commit 55f9c40ff632d03c527d6a6ceddcda0a224587a6)
> Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc
> 
> Please kindly let me know how it should be fixed...

[Taking Michal and linux-kbuild on cc]

I've seen this before with some of my ARM randconfig builds and
spent some time debugging into it, without success.

Can you build with KALLSYMS_EXTRA_PASS=1 and send the diff between
.tmp_kallsyms2.S and .tmp_kallsyms3.S?

	Arnd
