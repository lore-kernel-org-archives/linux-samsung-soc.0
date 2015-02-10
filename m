From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] rtc: s3c: Fix the duplicate clock control
Date: Tue, 10 Feb 2015 12:31:17 -0800
Message-ID: <20150210123117.b8f3c446137f8d5fd90dda35@linux-foundation.org>
References: <1423537650-11832-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423537650-11832-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: a.zummo@towertech.it, kgene@kernel.org, kyungmin.park@samsung.com, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 10 Feb 2015 12:07:30 +0900 Chanwoo Choi <cw00.choi@samsung.com> wrote:

> This patch fixes the duplicate clock control and split out clock control
> function as s3c_rtc_enable_clk()/s3c_rtc_disable_clk() to simplify code.

"fixes"?  This is a pretty big patch and it is poorly described.

Please provide a complete description of what is wrong with the
original code and how this patch alters it.  Please be sure to describe
the user-visible effects of the bug.
