From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH CRITICAL] ARM: s3c64xx: dt: Fix boot failure due to double
 clock initialization
Date: Sat, 14 Dec 2013 12:30:24 -0500
Message-ID: <52AC95B0.7090303@ti.com>
References: <1386964779-29457-1-git-send-email-tomasz.figa@gmail.com>
 <201312140400.16794.arnd@arndb.de> <52AC4568.7030201@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <52AC4568.7030201@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-samsung-soc@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <tomasz.figa@gmail.com>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Saturday 14 December 2013 06:47 AM, Sebastian Hesselbarth wrote:

[..]

> From 4ef4720c0d7ca9be57b06dc7ab1483c77a5ada1d Mon Sep 17 00:00:00 2001
> From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Date: Sat, 14 Dec 2013 12:21:01 +0100
> Subject: [PATCH] ARM: keystone: remove call to of_clk_init
> 
> Commit
> 
> 4178bac ARM: call of_clk_init from default time_init handler
> 
> added implicit call to of_clk_init(NULL) from default time_init callback.
> This causes double clock initialization on keystone, leading to boot
> failures.
> 
> This patch fixes boot failure on keystone by dropping the call to
> of_clk_init(NULL) in keystone_pm_runtime_init(), which is set as
> subsys_initcall and therefore called after arch-wide .init_time callback.
> 
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> ---
I already have a patch [1] for this in my queue. Thanks

Regards,
Santosh
[1] http://www.spinics.net/lists/arm-kernel/msg288578.html
