From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [RESEND PATCH V3 15/15] ARM: dts: Fix I2S1,
 I2S2 compatible for exynos4 SoCs
Date: Fri, 06 Feb 2015 12:30:45 +0100
Message-ID: <54D4A5E5.4010706@samsung.com>
References: <1422972382-18520-1-git-send-email-s.nawrocki@samsung.com>
 <1422972382-18520-3-git-send-email-s.nawrocki@samsung.com>
 <20150205194105.GM21293@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-reply-to: <20150205194105.GM21293@sirena.org.uk>
Sender: stable-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: kgene@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 05/02/15 20:41, Mark Brown wrote:
> On Tue, Feb 03, 2015 at 03:06:22PM +0100, Sylwester Nawrocki wrote:
>> I2S1, I2S2 on Exynos4 SoC series have limited functionality compared
>> to I2S0, "samsung,s3c6410-i2s" compatible should be used for them.
> 
> I've applied this even though I really shouldn't in order to get it in.
> Since it's a bug fix for stable it should've been near the head of any
> series it's part of not the very last patch in the series, and since
> it's not really related to the rest of the series except in that it
> relates to the same driver it should probably have been sent by itself
> rather than mixed in with everything else.

Indeed I could sent this one separately to Kukjin, the issue it fixes
was just found in the course of creating remaining part of the series
and I wanted to keep somewhat related changes together.
Thank you for merging it.  I hope you picked up the previous 2 as well,
I couldn't see them in your tree.
