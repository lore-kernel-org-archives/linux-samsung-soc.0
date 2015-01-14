From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 02/16] ASoC: samsung: i2s: samsung_i2s_get_driver_data()
 cleanup
Date: Wed, 14 Jan 2015 12:52:16 +0100
Message-ID: <54B65870.20509@samsung.com>
References: <1418997336-17777-1-git-send-email-s.nawrocki@samsung.com>
 <1418997336-17777-3-git-send-email-s.nawrocki@samsung.com>
 <20150106181402.GP2634@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:13530 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751127AbbANLwU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 06:52:20 -0500
In-reply-to: <20150106181402.GP2634@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: kgene@kernel.org, alsa-devel@alsa-project.org, padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 06/01/15 19:14, Mark Brown wrote:
> On Fri, Dec 19, 2014 at 02:55:22PM +0100, Sylwester Nawrocki wrote:
>> > Tidy up the samsung_i2s_get_driver_data() function by using
>> > IS_ENABLE() instead of #ifdef and add missing braces for
>> > the 'else' part. Also ensure we are not dereferencing NULL
>> > 'match' pointer.
>
> This doesn't apply against current code, can you please check and
> resend?

OK, I will resend it rebased onto your 3.19-rc1 topic/samsung branch.
