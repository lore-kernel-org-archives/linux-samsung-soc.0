From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ASoC: samsung: Prevent clk_get_rate() calls in atomic
 context
Date: Thu, 07 Feb 2019 15:47:14 +0100
Message-ID: <21b8ccd7-e379-b4aa-3257-c9644ce3664c@samsung.com>
References: <CGME20190207142052epcas1p22f1dc03c371674434ff40150cf376b6a@epcas1p2.samsung.com>
        <20190207142041.19394-1-s.nawrocki@samsung.com>
        <20190207143214.GC6190@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190207143214.GC6190@sirena.org.uk>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, krzk@kernel.org, sbkim73@samsung.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 2/7/19 15:32, Mark Brown wrote:
> On Thu, Feb 07, 2019 at 03:20:41PM +0100, Sylwester Nawrocki wrote:
> 
>> [   82.109780] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:908
>> [   82.117009] in_atomic(): 1, irqs_disabled(): 128, pid: 1554, name: speaker-test
>> [   82.124235] 3 locks held by speaker-test/1554:
>> [   82.128653]  #0: cc8c5328 (snd_pcm_link_rwlock){...-}, at: snd_pcm_stream_lock_irq+0x20/0x38

> Please think hard before including complete backtraces in upstream
> reports, they are very large and contain almost no useful information
> relative to their size so often obscure the relevant content in your
> message. If part of the backtrace is usefully illustrative then it's
> usually better to pull out the relevant sections.

OK, let me trim the backtrace some more and resend.
