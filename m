From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 5/5] regulator: tps65090: Make FETs more reliable by
 adding retries
Date: Wed, 16 Apr 2014 15:59:10 -0700
Message-ID: <CAD=FV=V-2OLVV_H+3HoRAq788tjKSCag9Wydam-bJCdL6VmCDA@mail.gmail.com>
References: <1397592876-5741-1-git-send-email-dianders@chromium.org>
	<1397672724-9063-1-git-send-email-dianders@chromium.org>
	<1397672724-9063-6-git-send-email-dianders@chromium.org>
	<20140416205136.GZ12304@sirena.org.uk>
	<CAD=FV=Wf=hdggX-Z1gtiVJdwr7jwjY1owCVZDq_BrWOyj-3m3A@mail.gmail.com>
	<20140416215450.GF12304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140416215450.GF12304@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Anton Vorontsov <anton@enomsg.org>, Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Simon Glass <sjg@chromium.org>, Michael Spang <spang@chromium.org>, Sean Paul <seanpaul@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Mark,

On Wed, Apr 16, 2014 at 2:54 PM, Mark Brown <broonie@kernel.org> wrote:
> On Wed, Apr 16, 2014 at 02:34:47PM -0700, Doug Anderson wrote:
>> On Wed, Apr 16, 2014 at 1:51 PM, Mark Brown <broonie@kernel.org> wrote:
>
>> > Please don't send new patches as replies in the middle of threads, it
>> > makes it confusing trying to work out which versions of things should be
>> > applied.
>
>> I'm a little confused about what I did wrong.  Can you give more details?
>
> I'm seeing a reply which looks like it was sent as a followup to Randy's
> comment, although now I look at everything together I think that's due
> to you sending your new thread in reply to the old thread (that can also
> be a problem due to threading either burying the new mail or putting
> things in odd places) and my mailer trying to tie the one mail from your
> first series that I'd not deleted into the thread.

OK, I'm about to send my v3 of the thread taking Randy's comments
about kernel-doc into account.  I'll explicitly not mark it as
"in-reply-to" the previous thread and hope that solves the problems
you were seeing.

-Doug
