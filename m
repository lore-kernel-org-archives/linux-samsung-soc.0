From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: Re: [media-s3c-camif] question about arguments position
Date: Thu, 04 May 2017 14:50:04 -0500
Message-ID: <20170504145004.Horde.gvFfFeEbpRydR4Pody_ABxy@gator4166.hostgator.com>
References: <20170504140502.Horde.e_TqvS0_CEqTDsNh1soDOGo@gator4166.hostgator.com>
 <e2137221-f094-530b-e61c-70e28f22a83f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e2137221-f094-530b-e61c-70e28f22a83f@gmail.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Sylwester,

Quoting Sylwester Nawrocki <sylvester.nawrocki@gmail.com>:

> Hi Gustavo,
>
> On 05/04/2017 09:05 PM, Gustavo A. R. Silva wrote:
>> The issue here is that the position of arguments in the call to
>> camif_hw_set_effect() function do not match the order of the parameters:
>>
>> camif->colorfx_cb is passed to cr
>> camif->colorfx_cr is passed to cb
>>
>> This is the function prototype:
>>
>> void camif_hw_set_effect(struct camif_dev *camif, unsigned int effect,
>>             unsigned int cr, unsigned int cb)
>>
>> My question here is if this is intentional?
>>
>> In case it is not, I will send a patch to fix it. But first it would be
>> great to hear any comment about it.
>
> You are right, it seems you have found a real bug. Feel free to send a patch.
> The best thing to do now might be to change the function prototype to:
>
> void camif_hw_set_effect(struct camif_dev *camif, unsigned int effect,
>              unsigned int cb, unsigned int cr)
>

OK, I'll send a patch for this shortly.

Thanks for clarifying.
--
Gustavo A. R. Silva
