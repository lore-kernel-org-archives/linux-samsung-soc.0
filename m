From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 3/4] Documentation: devicetree: Fix tps65090 typos
Date: Wed, 25 Jun 2014 07:23:20 -0500
Message-ID: <CAL_Jsq+TC4wtAJh96V2AC6nqoym0PuZmJP0Ho8qehFH99zgBiw@mail.gmail.com>
References: <1403486483-4063-1-git-send-email-afaerber@suse.de>
 <1403486483-4063-4-git-send-email-afaerber@suse.de> <CAD=FV=UUGQ_ULm+juj0hMxCKhhcXTa2aJT50Y=WrePy9g8u-zA@mail.gmail.com>
 <20140625104732.GE14495@leverpostej> <53AAB5D6.50500@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <53AAB5D6.50500@suse.de>
Sender: linux-doc-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Doug Anderson <dianders@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@linaro.org>, Simon Glass <sjg@chromium.org>, Michael Spang <spang@chromium.org>, "OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, DOCUMENTATION <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Jun 25, 2014 at 6:43 AM, Andreas F=C3=A4rber <afaerber@suse.de>=
 wrote:
> Am 25.06.2014 12:47, schrieb Mark Rutland:
>> On Mon, Jun 23, 2014 at 06:27:04PM +0100, Doug Anderson wrote:
>>> Andreas,
>>>
>>> On Sun, Jun 22, 2014 at 6:21 PM, Andreas F=C3=A4rber <afaerber@suse=
=2Ede> wrote:
>>>> It's vsys-l{1,2}-supply, not vsys_l{1,2}-supply.
>>>>
>>>> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>>> ---
>>>>  Documentation/devicetree/bindings/regulator/tps65090.txt | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/regulator/tps65090.=
txt b/Documentation/devicetree/bindings/regulator/tps65090.txt
>>>> index 34098023..ca69f5e 100644
>>>> --- a/Documentation/devicetree/bindings/regulator/tps65090.txt
>>>> +++ b/Documentation/devicetree/bindings/regulator/tps65090.txt
>>>> @@ -45,8 +45,8 @@ Example:
>>>>                 infet5-supply =3D <&some_reg>;
>>>>                 infet6-supply =3D <&some_reg>;
>>>>                 infet7-supply =3D <&some_reg>;
>>>> -               vsys_l1-supply =3D <&some_reg>;
>>>> -               vsys_l2-supply =3D <&some_reg>;
>>>> +               vsys-l1-supply =3D <&some_reg>;
>>>> +               vsys-l2-supply =3D <&some_reg>;
>>>
>>> Your change matches the code and all existing device trees in the
>>> Linux kernel.
>>
>> Could this fact please be mentioned in the commit message?
>
> Yes, I admit the commit message could've been clearer in stating that
> only the example is modified, not the actual specification. What abou=
t:
>
> "Specification and existing device trees use vsys-l{1,2}-supply, not
> vsys_l{1,2}-supply. Fix the example to match the specification."
>
> Maybe also "... typos in example" in the subject.
>
> Let me know whether I should send a v2 or let maintainers fix it up.

Please send v2.

Rob
