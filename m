From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] pinctrl: samsung: Allow pin value to be initialized using
 pinfunc.
Date: Tue, 19 Nov 2013 11:46:10 -0700
Message-ID: <528BB1F2.4080107@wwwdotorg.org>
References: <1384881351-10782-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1384881351-10782-1-git-send-email-t.figa@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Doug Anderson <dianders@chromium.org>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 11/19/2013 10:15 AM, Tomasz Figa wrote:
> This patch extends the range of settings configurable via pinfunc API
> to cover pin value as well. This allows configuration of default values
> of pins.

Shouldn't there be a driver that acquires the GPIO that's output to the
pin, and configures the output value? IIRC there have been previous
discussions re: having a list of e.g. initial GPIO output values in DT,
and that was rejected, and this patch seems to be doing almost the exact
same thing, just at the pinctrl level rather than GPIO level.

That all said, I admit this could be a useful feature...
