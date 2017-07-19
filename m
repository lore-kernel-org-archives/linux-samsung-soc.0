From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] media: Convert to using %pOF instead of full_name
Date: Wed, 19 Jul 2017 14:05:42 -0700
Message-ID: <596FC9A6.7090509@gmail.com>
References: <CGME20170718215328epcas2p2e5e1d7df96fcd894e70a961df864abdd@epcas2p2.samsung.com>
 <20170718214339.7774-33-robh@kernel.org>
 <564a6768-3b23-6dc7-ecb5-cb4f4359b633@samsung.com>
 <CAL_JsqLDCgO60ECGB70pMNcaLg0zUcJ6_+50vH-evfGe-D266Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLDCgO60ECGB70pMNcaLg0zUcJ6_+50vH-evfGe-D266Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "Lad, Prabhakar" <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Houlong Wei <houlong.wei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, =?UTF-8?Q?Niklas_S=c3=b6der
List-Id: linux-samsung-soc@vger.kernel.org

On 07/19/17 09:02, Rob Herring wrote:
> On Wed, Jul 19, 2017 at 4:41 AM, Sylwester Nawrocki
> <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> On 07/18/2017 11:43 PM, Rob Herring wrote:
>>> Now that we have a custom printf format specifier, convert users of
>>> full_name to use %pOF instead. This is preparation to remove storing
>>> of the full path string for each node.
>>>
>>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>>> ---

< snip >

>>> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
>>> index 851f128eba22..0a385d1ff28c 100644
>>> --- a/drivers/media/v4l2-core/v4l2-async.c
>>> +++ b/drivers/media/v4l2-core/v4l2-async.c
>>> @@ -47,9 +47,7 @@ static bool match_fwnode(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
>>>       if (!is_of_node(sd->fwnode) || !is_of_node(asd->match.fwnode.fwnode))
>>>               return sd->fwnode == asd->match.fwnode.fwnode;
>>>
>>> -     return !of_node_cmp(of_node_full_name(to_of_node(sd->fwnode)),
>>> -                         of_node_full_name(
>>> -                                 to_of_node(asd->match.fwnode.fwnode)));
>>> +     return to_of_node(sd->fwnode) == to_of_node(asd->match.fwnode.fwnode);
>>
>> I'm afraid this will not work, please see commit d2180e0cf77dc7a7049671d5d57d
>> "[media] v4l: async: make v4l2 coexist with devicetree nodes in a dt overlay"

Commit d2180e0cf77dc7a7049671d5d57d seems to have a fundamental
misunderstanding of overlays, if I understand the implications of that
commit.

When an overlay (1) is removed, all uses and references to the nodes and
properties in that overlay are no longer valid.  Any driver that uses any
information from the overlay _must_ stop using any data from the overlay.
Any driver that is bound to a new node in the overlay _must_ unbind.  Any
driver that became bound to a pre-existing node that was modified by the
overlay (became bound after the overlay was applied) _must_ adjust itself
to account for any changes to that node when the overlay is removed.  One
way to do this is to unbind when notified that the overlay is about to
be removed, then to re-bind after the overlay is completely removed.

If an overlay (2) is subsequently applied, a node with the same
full_name as from overlay (1) may exist.  There is no guarantee
that overlay (1) and overlay (2) are the same overlay, even if
that node has the same full_name in both cases.


> Maybe I'm missing something, but how does that work exactly? Before
> the overlay is applied, the remote endpoint node (and its parent)
> can't be resolved. In the commit example, the endpoint in the
> media_bridge would also have to be part of the overlay. If you apply
> and un-apply the overlay, then the of_node (and fw_node) in the
> overlay is once again invalid. IOW, you should be in the same state as
> before the overlay was applied. The node is still around because of
> paranoia that actually freeing nodes would break things. It seems this
> paranoia is real, so i think we need to do something to prevent this
> from spreading.

My understanding is that nodes from an un-applied overlay will be
freed if the expanded device tree that was used to create it has
its reference counts drop to zero.  But I wouldn't count on me
remembering this correctly without actually walking through all
the code.  And as far as I know, there is no example of this
in the mainline tree.


> Furthermore, it does not appear that any media driver supports
> overlays and we have no general way to apply them in mainline yet
> (other than an in kernel API). So really this scenario is not one we
> have to support yet.
> 
> Rob
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
