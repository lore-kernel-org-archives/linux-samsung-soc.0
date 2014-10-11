From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 0/5] pinctrl: samsung: Data structure clean-up
Date: Sat, 11 Oct 2014 20:52:01 +0200
Message-ID: <54397C51.20804@gmail.com>
References: <1412275931-10807-1-git-send-email-tomasz.figa@gmail.com> <CACRpkdY1GjDEfRH=48e24m+UcKzdPhROJBKDertS+q+e0td03g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY1GjDEfRH=48e24m+UcKzdPhROJBKDertS+q+e0td03g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

On 08.10.2014 12:23, Linus Walleij wrote:
> On Thu, Oct 2, 2014 at 8:52 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> 
>> This series intends to clean up data structures used by pinctrl-samsung driver.
>> More specifically, it separates initial compile time constants from data used
>> at runtime, allowing unused variant data to be dropped and selected structures
>> constified to improve safety.
> 
> Thanks!
> 
> The patches missed the v3.18 merge window, but I have queued them up as
> the first thing to go into v3.19.

OK, thanks.

> 
> Now I need you to help me check the patch set from Abhilash so I know
> what to do about that, whenever you have some time...

I've already acked previous version of that series, only with some minor
nitpicks pointed, but let me take a look at last version.

Best regards,
Tomasz
