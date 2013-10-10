**IRC.app** is a genericized verison of a superb, BSD-licensed IRC client for Mac,
the name of which (being the adjectival form of the word _"text"_) I have
**thoroughly** redacted here to hide from search engines. The upstream product is
sold on the Mac App Store, and I don't want people searching for ``` free ...```
or ```how do I build ...``` to find this and risk cannibalizing sales of the
the 'real thing'. If you like what you find here, you are **strongly** encouraged
to buy it. You can find the upstream source for the here on Github as well,
and the code here has been forked from that, but I've uncoupled the fork from
the original for the same reason. The only real difference here is that it is
slightly easier to build as it does not require a code-signing identity, nor
~~nag~~ warn you about not having one. The links to the support channel, etc. have also been removed.

#### Installing
There is a binary available [here](http://github.com/g-nix/IRC.app/releases/download/3.2.3/IRC.app.zip),
built against the 10.8 SDK.  
~~It is not codesigned, so you'll need to pacify Gatekeeper.~~   
***Update:*** I've decided, for now, to code sign the binary myself, until I have time to cherry-pick
through the code upstream and figure out why, exactly, logging to file doesn't work when the binary is unsigned.
I haven't tested it on anything besides my own machine; and it doesn't mean this is official in any way;
no warranty expressed or implied, etc., etc. So please, instead, consider:

#### Builing Your Own
Requirements: Xcode installed and configured on a Mac running 10.8+.  

Checkout the source, then type:

```
xcodebuild -scheme 'IRC (Standard Release)' -configuration Release -alltargets
```

The app will be in ```Build Results/Release```.
Copy ```IRC.app``` to your Applications folder (or wherever).

#### Support

None.

If you can't figure something out and want support, buy the original from the
Mac App Store. You won't get any support here, and you certainly won't from
the upstream developers. If you think you've found a bug and want to report it,
you'll need to check out the code of the original project and see if the
bug existed there too. If so, file it upstream; if the bug is peculiar to
**this** neutered version, you can file one here or submit a pull request.
Maybe I'll do something about it. 

The code here is based on a checkout of the original project
on 4 October 2013. I may update it from time to time, I may not.

## License

The license below is identical to that of the upstream project, except
(again, so that IRC.app does not appear in searches for the original)
the name of the application has been omitted.
## 
Copyright (c) 2008 - 2010 Satoshi Nakagawa <psychs AT limechat DOT net>
All rights reserved.
Copyright (c) 2010 — 2013 Codeux Software & respective contributors.
       Please see Contributors.rtfd and Acknowledgements.rtfd

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

   * Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
   * Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in the
     documentation and/or other materials provided with the distribution.
   * Neither the name of the IRC Client & Codeux Software nor the
     names of its contributors may be used to endorse or promote products
     derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.

Note: The IRC Client uses the BSD license because it was the one
in place when they forked the Limechat project. They obtained our copy of the
original source code before it was converted to a GPL based license. The
original license is as follows:

The New BSD License

Copyright (c) 2008 - 2010 Satoshi Nakagawa <psychs AT limechat DOT net>
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.
