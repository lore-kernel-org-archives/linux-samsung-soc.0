From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] pinctrl: samsung: Staticize drvdata_list
Date: Mon, 24 Jun 2013 14:30:42 +0200
Message-ID: <CACRpkdbHPPaJnkNq90bPTM1at+uzwww3P2mU-HaeNgi7kFNGzw@mail.gmail.com>
References: <1372072821-22450-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1372072821-22450-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Patch Tracking <patches@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jun 24, 2013 at 1:20 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:

> 'drvdata_list' is used only in this file. Make it static.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Patch applied.

Yours,
Linus Walleij
