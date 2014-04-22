From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 5/5] regulator: tps65090: Make FETs more reliable by
 adding retries
Date: Tue, 22 Apr 2014 08:28:44 -0700
Message-ID: <CAD=FV=W71HQyua8=aq8gb12hvnSYGPYGuEcQZ=3=iVUNiAaXcA@mail.gmail.com>
References: <1397689950-1568-1-git-send-email-dianders@chromium.org>
	<1397689950-1568-6-git-send-email-dianders@chromium.org>
	<20140418174353.GX12304@sirena.org.uk>
	<CAD=FV=VQckC34rZwF2RP3F+2T1CRVs0JwtgoqUeA1NVmB20=sA@mail.gmail.com>
	<20140422074709.GD17657@lee--X1>
	<20140422110236.GN12304@sirena.org.uk>
	<20140422150753.GC21613@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140422150753.GC21613@lee--X1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Anton Vorontsov <anton@enomsg.org>, Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Simon Glass <sjg@chromium.org>, Michael Spang <spang@chromium.org>, Sean Paul <seanpaul@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Tue, Apr 22, 2014 at 8:07 AM, Lee Jones <lee.jones@linaro.org> wrote:
>> > If there are cross-subsystem dependencies I prefer to use immutable
>> > branches to eliminate any change of merge conflicts in -next or the
>> > next merge window. I'm happy to either create on with Mark's Acks, or
>> > receive a pull-request from Mark with mine applied.
>>
>> > Up to Mark.
>>
>> Well, Doug didn't send me the MFD patch so I can't do anything with it
>> anyway.
>
> Ah!
>
> Doug,
>   what exactly are the dependencies within the set?

I will repost the patch shortly with Mark on the CC list.  Status of
the patches in this series:

- Patch #1 (mfd no irq) has no dependencies, though patch #2 won't
  work without it.

https://patchwork.kernel.org/patch/4004441/

Acked by you.  Not landed anywhere that I'm aware of.

--

- Patch #2 (charger polling) can be applied without patch #1 but won't
  actually make charger polling work without it.

https://patchwork.kernel.org/patch/4004461/

Not acked or applied anywhere.

---

- Patch #3 (caching) can be applied before retries patch but not
  after.

https://patchwork.kernel.org/patch/4033361/

This is the patch we need.  I just resent with Mark on the CC list
(including your ack).

---

- Patch #4 (overcurrent wait time) can be applied before retries patch
  but not after (just due to merge conflicts, no other reason).

https://patchwork.kernel.org/patch/4004471/

I believe Mark has already applied.

---

- Patch #5 (retries) absolutely requires patch #3 (caching).

https://patchwork.kernel.org/patch/4004521/
