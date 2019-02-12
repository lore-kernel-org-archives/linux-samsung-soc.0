From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 00/22] ASoC: dmaengine updates, secondary CPU DAI for
 Odroid boards
Date: Tue, 12 Feb 2019 19:17:10 +0100
Message-ID: <7289d7f5-3ca3-c932-e1e8-bef0eb727226@samsung.com>
References: <CGME20190207170044epcas2p3d00762663b971845bc86db84af7d3b23@epcas2p3.samsung.com>
        <20190207170028.720-1-s.nawrocki@samsung.com>
        <20190212164032.GH20635@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190212164032.GH20635@sirena.org.uk>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 2/12/19 17:40, Mark Brown wrote:
> On Thu, Feb 07, 2019 at 06:00:08PM +0100, Sylwester Nawrocki wrote:
> 
>> I am not entirely sure we should be removing the
>> SND_DMAENGINE_PCM_FLAG_CUSTOM_CHANNEL_NAME flag like this, it might all
>> be a bit more explicit with the flag.
> 
> I'm fairly happy with what you're doing here and the Samsung driver is
> the only user so the view of people working on that is pretty important
> here.  I've gone ahead and applied the first few patches so they don't
> need rereviewing, the rest looked fine modulo the comments from
> Krzysztof.
 
Thank you, I've just resent the whole series with Krzysztof's comments 
addressed and with few more clean up patches added.

I've found one minor problem with the Odroid machine driver patch - 
limiting sampling rate to same value on both PCMs doesn't work properly.
I've got a patch fixing that almost ready and will post it tomorrow as
a folow up or v3 of "ASoC: samsung: odroid: Add support for secondary 
CPU DAI".
