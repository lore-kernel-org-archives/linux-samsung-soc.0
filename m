From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] pinctrl: samsung: don't truncate the last char of "-grp"
Date: Fri, 19 Jun 2015 11:52:03 +0300
Message-ID: <20150619085203.GO28762@mwanda>
References: <20150611154631.GA13202@mwanda>
 <CAJKOXPe8Pv5t9tLdFZAV+9CSiM302GTVt6_j3vKHkeFOK8U=Lw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJKOXPe8Pv5t9tLdFZAV+9CSiM302GTVt6_j3vKHkeFOK8U=Lw@mail.gmail.com>
Sender: kernel-janitors-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jun 15, 2015 at 01:17:36PM +0900, Krzysztof Kozlowski wrote:
> I would prefer splitting this into two patches: one for fixing
> truncated name (by usage of kasprintf) and second for ENOMEM message.
> The second patch can get rid of ENOMEM message in other places as
> well.
> 
> As for the first issue I think that function suffix would also be
> truncated in the same way.

Sorry for the delayed response, I've been offline for a few days.

Yeah, you're right.

Let me resend.

regards,
dan carpenter

