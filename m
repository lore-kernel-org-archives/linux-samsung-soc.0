From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: Looking for example to use samsung jpeg v4l2 mem2mem driver
Date: Wed, 08 Jan 2014 21:54:39 +0100
Message-ID: <52CDBB0F.8010505@gmail.com>
References: <CABMudhTUQ1mBLTHnm50dWrZaOhRciTc8J_jET1xLho8pm8iC7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <CABMudhTUQ1mBLTHnm50dWrZaOhRciTc8J_jET1xLho8pm8iC7Q@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: m silverstri <michael.j.silverstri@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, LMML <linux-media@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 01/01/2014 12:39 AM, m silverstri wrote:
> Hi,
>
> I am looking for an example which uses samsung jpeg v4l2 mem2mem driver.
> For example the 'Exynos4 JPEG codec v4l2 driver' described here
> http://lwn.net/Articles/468547
>
>
> I am new to linux v4l2 driver. I am looking for example to pass an
> input image to hardware accelerated encoder/decoder.

I have pushed some test application to a git repository at [1]. It can be
used for JPEG files encoding/decoding with the mainline s5p-jpeg driver.
A v4l2-jpeg-codec-test directory should appear there within few hours.

[1] http://git.infradead.org/users/kmpark/public-apps/tree/refs/heads/master

Regards,
Sylwester
