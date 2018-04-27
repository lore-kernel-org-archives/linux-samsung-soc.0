From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 00/24] device link, bridge supplier <-> drm device
Date: Fri, 27 Apr 2018 09:37:11 +0200
Message-ID: <7d4bceeb-9611-cbf9-3906-fef5db88aad8@axentia.se>
References: <CGME20180426223215epcas2p38fe3b0b7b1ea1c8190805f9e2a89e11e@epcas2p3.samsung.com>
 <20180426223139.16740-1-peda@axentia.se>
 <25d8e621-b3f8-094f-32a2-d22efc2163a4@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <25d8e621-b3f8-094f-32a2-d22efc2163a4@samsung.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrzej Hajda <a.hajda@samsung.com>, linux-kernel@vger.kernel.org
Cc: Martyn Welch <martyn.welch@collabora.co.uk>, David Airlie <airlied@linux.ie>, Gustavo Padovan <gustavo@padovan.org>, dri-devel@lists.freedesktop.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Archit Taneja <architt@codeaurora.org>, linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, CK Hu <ck.hu@mediatek.com>, Martin Donnelly <martin.donnelly@ge.com>, linux-arm-msm@vger.kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Jyri Sarha <jsarha@ti.com>, Inki Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Vincent Abriou <vincent.abriou@st.com>, linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.ki>
List-Id: linux-samsung-soc@vger.kernel.org

On 2018-04-27 09:11, Andrzej Hajda wrote:
> Hi Peter,
> 
> On 27.04.2018 00:31, Peter Rosin wrote:
>> Hi!
>>
>> It was noted by Russel King [1] that bridges (not using components)
>> might disappear unexpectedly if the owner of the bridge was unbound.
>> Jyri Sarha had previously noted the same thing with panels [2]. Jyri
>> came up with using device links to resolve the panel issue, which
>> was also my (independent) reaction to the note from Russel.
>>
>> This series builds up to the addition of that link in the last
>> patch, but in my opinion the other 23 patches do have merit on their
>> own.
>>
>> The last patch needs testing, while the others look trivial. That
>> said, I might have missed some subtlety.
> 
> of_node is used as an identifier of the bridge in the kernel. If you
> replace it with device pointer there will be potential problem with
> devices having two or more bridges, how do you differentiate bridges if
> the owner is the same? If I remember correctly current bridge code does
> not allow to have multiple bridges in one device, but that should be
> quite easy to fix if necessary. After this change it will become more
> difficult.

I don't see how it will be more difficult?

> Anyway I remember discussion that in DT world bridge should be
> identified rather by of_graph port node, not by parent node as it is
> now. If you want to translate this relation to device owner, you should
> add also port number to have full identification of the bridge, ie pair
> (owner, port_number) would be equivalent of port node.

You even state the trivial solution here, just add the port/endpoint ID
when/if it is needed. So, what is the significant difference?

Cheers,
Peter
