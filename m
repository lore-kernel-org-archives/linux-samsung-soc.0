From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] regulator: s2mps11: Fix GPIO suspend enable shift
 wrapping bug
Date: Wed, 24 Jun 2015 19:43:58 +0900
Message-ID: <CAJKOXPdOu_iHYthSLt=z0a+VMjY46_XaL0NxbHcjLBAjs4UJOg@mail.gmail.com>
References: <1432696928-4690-1-git-send-email-k.kozlowski@samsung.com>
	<20150528144449.GZ21577@sirena.org.uk>
	<CAJKOXPc3_uHBqKYShn603OT=UdLk-Q=i9Q84rwywtNpCTfUp=w@mail.gmail.com>
	<20150624093144.GE14071@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20150624093144.GE14071@sirena.org.uk>
Sender: stable-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

2015-06-24 18:31 GMT+09:00 Mark Brown <broonie@kernel.org>:
> On Wed, Jun 24, 2015 at 01:02:28PM +0900, Krzysztof Kozlowski wrote:
>> 2015-05-28 23:44 GMT+09:00 Mark Brown <broonie@kernel.org>:
>> > On Wed, May 27, 2015 at 12:22:08PM +0900, Krzysztof Kozlowski wrote:
>> >> Status of enabling suspend mode for regulator was stored in bitmap-like
>> >> long integer.
>
>> > Applied, thanks.
>
>> Mark, what happened with this patch? I can't find it in your tree.
>
> I don't know.  If it's not there it's not there and you'll need to
> resend, sorry.  There were some problems with error handling for bad
> networks when pushing things but it looks like this was after I fixed
> those.

Okay, it happens. If you don't mind, I'll resend now, during merge
window. If it is bad timing, then let me know or postpone the patch.
This is a fix so in my humble opinion it's a candidate for 4.2-rc
(although it would be nice if this could sit in linux-next for a
while).

Best regards,
Krzysztof
