From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Question about "Inconsistent kallsyms data"
Date: Fri, 29 Jul 2011 15:00:03 +0200
Message-ID: <1338073.oTaTOFP5NR@wuerfel>
References: <02ae01cc4d91$aed71670$0c854350$%kim@samsung.com> <2563791.8cBqodrk1o@flatron> <1514384.7oMe1aulyC@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <1514384.7oMe1aulyC@flatron>
Sender: linux-kbuild-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Friday 29 July 2011 13:30:20 Tomasz Figa wrote:
> 
> I have no idea why, but I cannot reproduce the issue anymore, even after make 
> distclean or starting with a clean tree. A build system bug?
> 
> I do not know much technical details about the kernel build system, but might 
> it be a concurrency issue (I use make -j5 for building with 5 jobs)?

I could reproduce it on some systems, but it changes when you switch compiler
versions or other flags, or the exact kernel version, so it's impossible
to bisect if you have the same problem that I saw.

I got all the way to the point where I could add a nop instruction in one
file and it would go away because the code size grew across some magic
number.

	Arnd
