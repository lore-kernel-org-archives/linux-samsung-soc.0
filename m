From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/7] ARM: SAMSUNG: Code cleanup for various devices
Date: Thu, 21 Jul 2011 02:07:26 +0900
Message-ID: <06c901cc46ff$826a9690$873fc3b0$%kim@samsung.com>
References: <1311077106-28351-1-git-send-email-banajit.g@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1311077106-28351-1-git-send-email-banajit.g@samsung.com>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Banajit Goswami' <banajit.g@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org
List-Id: linux-samsung-soc@vger.kernel.org

Banajit Goswami wrote:
> 
>  Use generic s3c_set_platdata to perform the same job. Saves a few lines
>  of code.
> 
>  The patches are created against "for-next" branch of Kukjin Kim's tree
at:
>  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> 
>  These patches are only compile tested.
> 
>  o To Kukjin Kim
>   PATCH[1/7] ARM: SAMSUNG: Use generic s3c_set_platdata for TS
>   PATCH[2/7] ARM: SAMSUNG: Use generic s3c_set_platdata for FB
>   PATCH[3/7] ARM: SAMSUNG: Use generic s3c_set_platdata for HWMON
>   PATCH[4/7] ARM: SAMSUNG: Use generic s3c_set_platdata for USB OHCI
>   PATCH[5/7] ARM: SAMSUNG: Use generic s3c_set_platdata for NAND
> 
>  o To Ben Dooks
>   PATCH[6/7] ARM: S3C64XX: Use generic s3c_set_platdata for OneNAND
>   PATCH[7/7] ARM: S3C24XX: Use generic s3c_set_platdata for devices
> 
>  arch/arm/mach-s3c64xx/dev-onenand1.c |   10 +++-----
>  arch/arm/plat-s3c24xx/devs.c         |   38
++++++---------------------------
>  arch/arm/plat-samsung/dev-fb.c       |   14 +----------
>  arch/arm/plat-samsung/dev-hwmon.c    |   14 +----------
>  arch/arm/plat-samsung/dev-nand.c     |    9 ++-----
>  arch/arm/plat-samsung/dev-ts.c       |   14 +----------
>  arch/arm/plat-samsung/dev-usb.c      |    9 +------
>  7 files changed, 22 insertions(+), 86 deletions(-)
> 
> --
> 1.7.2.3

Applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
