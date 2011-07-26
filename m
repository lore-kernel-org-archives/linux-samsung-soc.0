From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 0/8] ARM: SAMSUNG: Add common PWM Backlight support
Date: Tue, 26 Jul 2011 06:57:27 +0000 (UTC)
Message-ID: <j0logn$1bn$1@dough.gmane.org>
References: <1310740968-26722-1-git-send-email-banajit.g@samsung.com>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

On Fri, 15 Jul 2011 20:12:40 +0530, Banajit Goswami wrote:

> The patches are created against "for-next" branch of Kukjin Kim's tree
> at:
>  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> 
>  Patch [1/8]
>   -- add a common infrastructure to support PWM backlight for various
>      Samsung boards.

Why can't you use the drivers/video/backlight/pwm-bl.c ?

-- 
With best wishes
Dmitry
