From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] regulator: s2mps11: Fix GPIO suspend enable shift
 wrapping bug
Date: Wed, 24 Jun 2015 13:02:28 +0900
Message-ID: <CAJKOXPc3_uHBqKYShn603OT=UdLk-Q=i9Q84rwywtNpCTfUp=w@mail.gmail.com>
References: <1432696928-4690-1-git-send-email-k.kozlowski@samsung.com>
	<20150528144449.GZ21577@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20150528144449.GZ21577@sirena.org.uk>
Sender: stable-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

2015-05-28 23:44 GMT+09:00 Mark Brown <broonie@kernel.org>:
> On Wed, May 27, 2015 at 12:22:08PM +0900, Krzysztof Kozlowski wrote:
>> Status of enabling suspend mode for regulator was stored in bitmap-like
>> long integer.
>
> Applied, thanks.

Mark, what happened with this patch? I can't find it in your tree.
