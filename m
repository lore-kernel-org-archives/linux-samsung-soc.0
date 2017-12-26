From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: samsung: document bindings for Midas
 family boards
Date: Tue, 26 Dec 2017 12:02:11 -0600
Message-ID: <CAL_JsqJo0NZ6qhr-cfAEVKc95qMuBPWN0Y8X6ZTa_wk3y2OMwQ@mail.gmail.com>
References: <20171218123805.26345-1-simon@lineageos.org> <20171218123805.26345-2-simon@lineageos.org>
 <20171220181759.6r4waz4seerh6q4i@rob-hp-laptop> <20171221014246.GA23568@lineageos.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171221014246.GA23568-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Dec 20, 2017 at 7:42 PM, Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org> wrote:
> Hi Rob,
>
> Thanks for the review.
>
> On Wed, Dec 20, 2017 at 12:17:59PM -0600, Rob Herring wrote:
>> On Mon, Dec 18, 2017 at 11:38:02PM +1100, Simon Shields wrote:
>> > Document GT-I9300, GT-I9305, GT-N7100, and GT-N7105 bindings, along
>> > with the shared "midas" binding.
>> >
>> > Signed-off-by: Simon Shields <simon-WP75azK+jQYgsBAKwltoeQ@public.gmane.org>
>> > ---
>> >  Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt | 4 ++++
>> >  1 file changed, 4 insertions(+)
>>
>> My comment on v2 remains.
>
> Do you have any example of a better description? All the other ARM board
> descriptions seem similarly terse.
>
> Alternatively, maybe changing the compatible strings is a better
> solution? "samsung,n710x" for t0, "samsung,i9300" for m0, and
> "samsung,i9305" for m3?

Yes, it was the compatible string I was commenting on. I don't really
care about the description because for most boards I have no idea what
they are.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
