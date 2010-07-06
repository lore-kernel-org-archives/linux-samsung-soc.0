From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v6 3/3] input: samsung-keypad - Add samsung keypad driver
Date: Tue, 06 Jul 2010 16:58:18 +0900
Message-ID: <4C32E21A.8080100@samsung.com>
References: <1277724824-13308-1-git-send-email-jy0922.shim@samsung.com>
 <1277724824-13308-3-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-input-owner@vger.kernel.org>
In-reply-to: <1277724824-13308-3-git-send-email-jy0922.shim@samsung.com>
Sender: linux-input-owner@vger.kernel.org
To: ch.naveen@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, dmitry.torokhov@gmail.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-input@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi, Naveen.

On 6/28/2010 8:33 PM, Joonyoung Shim wrote:
> This patch adds support for keypad driver running on Samsung cpus. This
> driver is tested on GONI and Aquila board using S5PC110 cpu.
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/input/keyboard/Kconfig          |    9 +
>  drivers/input/keyboard/Makefile         |    1 +
>  drivers/input/keyboard/samsung-keypad.c |  491 +++++++++++++++++++++++++++++++
>  3 files changed, 501 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/input/keyboard/samsung-keypad.c
> 

Could you please test this v6 keypad driver on your various targets?
